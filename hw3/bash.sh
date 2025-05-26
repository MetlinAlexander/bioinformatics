#!/bin/bash

read_set=$1
reference=$2

results_dir="results_$(date +'%Y-%m-%d_%H-%M-%S')"
mkdir -p "$results_dir"
mkdir -p "$results_dir/fastqc"

echo "Running FastQC..."
fastqc -t 6 -o "$results_dir/fastqc/" "$read_set"

echo "Indexing reference..."
bwa index "$reference"

echo "Aligning with BWA MEM..."
bwa mem -t 6 "$reference" "$read_set" > "$results_dir/mapping.sam"

echo "Converting to BAM..."
samtools view -b "$results_dir/mapping.sam" > "$results_dir/mapping.bam"

echo "Generating alignment stats..."
samtools flagstat "$results_dir/mapping.bam" > "$results_dir/mapping-report"

get_mapping_percent() {
    percent=$(grep "mapped" "$1" | awk -F'[(%]' '{print $2}' | head -1)
    echo "$percent"
}

mapping_percent=$(get_mapping_percent "$results_dir/mapping-report")
echo "Mapping percentage: $mapping_percent%"

if (( $(echo "$mapping_percent > 90" | bc -l 2>/dev/null) )); then
    echo "Mapping is OK"
else
    echo "Mapping is NOT OK, finishing"
    exit 1
fi

echo "Sorting and calling variants with freebayes..."
samtools sort "$results_dir/mapping.bam" -o "$results_dir/mapping.sorted.bam"
freebayes -f "$reference" -b "$results_dir/mapping.sorted.bam" > "$results_dir/mapping.vcf"

echo "Successfully finished. You can see results in $results_dir/mapping.vcf"