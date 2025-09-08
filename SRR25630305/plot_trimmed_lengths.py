#!/usr/bin/env python

import argparse, gzip
import matplotlib.pyplot as plt

def length_counts(fq_gz_path):
    """Return {length: count} from a gzipped FASTQ (sequence lines only)."""
    counts = {}
    with gzip.open(fq_gz_path, "rt") as fh:
        for i, line in enumerate(fh, start=1):
            if i % 4 == 2:  # sequence line
                L = len(line.rstrip("\n"))
                counts[L] = counts.get(L, 0) + 1
    return counts

def to_xy(counts):
    xs = sorted(counts)
    ys = [counts[x] for x in xs]
    tot = sum(ys) if ys else 1
    ys = [y / tot for y in ys]  # normalize to fraction
    return xs, ys, tot

def median_from_counts(counts):
    if not counts:
        return 0
    items = sorted(counts.items())  # (length, count)
    total = sum(c for _, c in items)
    halfway = (total + 1) // 2
    cum = 0
    for L, c in items:
        cum += c
        if cum >= halfway:
            return L
    return items[-1][0]

def make_plot(sample, r1_gz, r2_gz, out_png):
    c1 = length_counts(r1_gz)
    c2 = length_counts(r2_gz)
    x1, y1, n1 = to_xy(c1)
    x2, y2, n2 = to_xy(c2)
    med1 = median_from_counts(c1)
    med2 = median_from_counts(c2)

    plt.figure(figsize=(10, 6))
    plt.step(x1, y1, where="mid", label=f"R1 (n={n1}, median={med1})")
    plt.step(x2, y2, where="mid", label=f"R2 (n={n2}, median={med2})")
    plt.xlabel("Read length (nt)")
    plt.ylabel("Fraction of reads")
    plt.title(f"Trimmed read-length distribution — {sample}")
    plt.grid(True, alpha=0.4)
    plt.legend()
    plt.tight_layout()
    plt.savefig(out_png, dpi=150)
    print(f"[saved] {out_png}")

parser = argparse.ArgumentParser(
    description="Overlay R1/R2 trimmed read-length distributions from gzipped FASTQs (one sample)."
)
parser.add_argument("--sample", required=True)
parser.add_argument("--r1", required=True, help="R1 .fastq.gz (paired, trimmed)")
parser.add_argument("--r2", required=True, help="R2 .fastq.gz (paired, trimmed)")
parser.add_argument("-o", "--out", default=None, help="Output PNG (default: <sample>_trimmed_lengths.png)")
args = parser.parse_args()

out_png = args.out or f"{args.sample}_trimmed_lengths.png"
make_plot(args.sample, args.r1, args.r2, out_png)
