# Run the AWK Script in Linux Terminal using
# awk -f 210101028_Q1.awk INVENTORY.txt

BEGIN{
    # Header
    for(i=0;i<42;i++) printf("-");
    printf(" INVENTORY REPORT ");
    for(i=0;i<42;i++) printf("-");
    printf("\n\n");
    # Field Names
    printf("     Part No     Price     Quantity on Hand     Reorder Point     Minimum Order     Order Amount \n");
}

{
    # Line by line scanning and printing
    printf("       %s      %5.2f            %2d                  %2d                %2d               ", $1,$2,$3,$4,$5);
    if($3<$4) printf("%2d", $4+$5-$3);
    else printf("-");
    printf("\n");
}

END{
    # Footer
    printf("\n");
    for(i=0;i<45;i++) printf("-");
    printf(" END REPORT ");
    for(i=0;i<45;i++) printf("-");
    printf("\n\n");
}