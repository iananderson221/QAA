#!/usr/bin/env python

file_name = "/projects/bgmp/ica/bioinfo/Bi623/PS2/QAA/SRR25630397/Crh_rhy107_EO_adult.out.sorted.rmdup.sam"

# Dictionaries to store read mapping status
mapped_reads = {}
unmapped_reads = {}

# Initialize counters
mappedcount = 0
unmappedcount = 0

with open(file_name, "r") as fh:
    for line in fh:
        if line.startswith("@"):
            continue  # Skip header lines

        fields = line.strip().split("\t")
        qname = fields[0]       # Query/read name
        flag = int(fields[1])   # Bitwise flag

        # Check if this is a primary alignment
        if (flag & 256) != 256:
            # Check if read is mapped
            if (flag & 4) != 4:
                mappedcount += 1
                # Record read as mapped if never seen before
                mapped_reads[qname] = True
                if qname in unmapped_reads:
                    del unmapped_reads[qname]  # Remove from unmapped if previously recorded
            else:
                unmappedcount += 1
                # Record read as unmapped only if never seen as mapped
                if qname not in mapped_reads:
                    unmapped_reads[qname] = True

# Count unique mapped and unmapped reads
num_mapped = len(mapped_reads)
num_unmapped = len(unmapped_reads)

print(f"Number of unique mapped reads: {num_mapped}")
print(f"Number of unique unmapped reads: {num_unmapped}")
print(f"Primary mapped alignment count: {mappedcount}")
print(f"Primary unmapped alignment count: {unmappedcount}")

