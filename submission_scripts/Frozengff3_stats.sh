### To clean , sort and add introns

gt gff3 -sort -tidy -addintrons FrozenGeneCatalog20110204.gff3 >Tidy_Frozen.gff3

### To obtain the number of genes in the gff3 file

grep -c $'\tgene\t' Tidy_Frozen.gff3

### To obtain the features in the gff3 file

grep -v '^#' Tidy_Frozen.gff3 | cut -s -f 3 | sort | uniq -c | sort -rn | head

To obtain the length of each feature:

grep $'\tgene\t' Tidy_Frozen.gff3 | cut -s -f 4,5 |perl -ne '@v = split(/\t/); printf("%d\n", $v[1] - $v[0] + 1)' |sort -rn >Tidy_Frozen_genelength.txt

grep $'\tintron\t' Tidy_Frozen.gff3 | cut -s -f 4,5 |perl -ne '@v = split(/\t/); printf("%d\n", $v[1] - $v[0] + 1)' |sort -rn >Tidy_Frozen_intronlength.txt

grep $'\texon\t' Tidy_Frozen.gff3 | cut -s -f 4,5 |perl -ne '@v = split(/\t/); printf("%d\n", $v[1] - $v[0] + 1)' |sort -rn >Tidy_Frozen_exonlength.txt

grep $'\tCDS\t' Tidy_Frozen.gff3 | cut -s -f 4,5 |perl -ne '@v = split(/\t/); printf("%d\n", $v[1] - $v[0] + 1)' |sort -rn >Tidy_Frozen_CDSlength.txt
