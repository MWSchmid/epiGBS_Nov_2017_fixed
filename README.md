# Note

This repository is a snapshot of the ![original epiGBS pipeline](https://github.com/thomasvangurp/epiGBS) from November 2017. However, we included a [bug-fix](https://github.com/thomasvangurp/epiGBS/issues/26).

We recommend that you use the [new pipeline](https://github.com/nioo-knaw/epiGBS2).

# Running the pipeline without demultiplexing

## De novo reference creation

```SH
EPIGBSSCRIPTS="/path/to/the/folder/with/the/epigbs/scripts" # top folder of this repo
NUMTHREADS=28 # number of threads
BARCODEFILE="/path/to/the/file/with/barcodes.txt"
DMPFWD="/path/to/demultiplexed/forwardReads.fastq.gz"
DMPREV="/path/to/demultiplexed/reverseReads.fastq.gz"
REFOUT="/path/to/output/directory"
TMPDIR="/path/to/a/temporary/directory"
mkdir -p $REFOUT
mkdir -p $TMPDIR

export PATH="$PATH:$EPIGBSSCRIPTS"
$EPIGBSSCRIPTS/de_novo_reference_creation/make_reference.py --forward $DMPFWD --reverse $DMPREV --barcodes $BARCODEFILE --outputdir $REFOUT --threads $NUMTHREADS --tmpdir $TMPDIR
rm -r $TMPDIR/*
```

## Mapping and variant calling

```SH
VARCALLOUT="$TEMPDIR/varCallOut"
TMPDIRMORE="/path/to/another/temporary/directory"
mkdir -p $VARCALLOUT
mkdir -p $TMPDIRMORE
sed -i "s+/media/localData/sambamba+$TMPDIRMORE+g" $EPIGBSSCRIPTS/mapping_varcall/map_STAR.py

export PATH="$PATH:$EPIGBSSCRIPTS/mapping_varcall:$EPIGBSSCRIPTS/mapping_varcall/filtering:$EPIGBSSCRIPTS/mapping_varcall/statistics:$EPIGBSSCRIPTS/mapping_varcall/variant_calling"
$EPIGBSSCRIPTS/mapping_varcall/mapping_variant_calling.py --input_dir $REFOUT --barcodes $BARCODEFILE --threads $NUMTHREADS --output_dir $VARCALLOUT --tmpdir $TMPDIR
```
