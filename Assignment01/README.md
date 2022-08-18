# ASSIGNMENT 1
**Documentation for both Questions given below**

---

## Inventory Report Using AWK Script

1. Creates the Title of the Report
``` js
BEGIN{
    for(i=0;i<42;i++) printf("-");
    printf(" INVENTORY REPORT ");
    for(i=0;i<42;i++) printf("-");
    printf("\n\n");}
```

2. Creates all headers
``` js
    printf("     Part No     Price     Quantity on Hand     Reorder Point     Minimum Order     Order Amount \n");
```

3. Iterates through the Records and Prints them
``` js
    printf("       %s      %5.2f            %2d                  %2d                %2d               ", $1,$2,$3,$4,$5);
```

4. If Quantity on Hand is less than Reorder Point,
then `Order_Amount = Reorder_Point + Minimum_Order - Quantity_On_Hand`
``` js
    if($3<$4) printf("%2d", $4+$5-$3);
    else printf("NA");
    printf("\n");
```

5. Creates End of Report message
``` js
END{
    printf("\n");
    for(i=0;i<45;i++) printf("-");
    printf(" END REPORT ");
    for(i=0;i<45;i++) printf("-");
    printf("\n\n");
}
```

---
## Payroll Register Using Bash Script

1. Creates the Title of the Register
``` js
for i in {1..51}
do
    echo -n "-"
done
echo -n " PAYROLL REGISTER "
for i in {1..51}
do
    echo -n "-"
done
```

2. Creates all Headers
``` js
echo "     Employee No    Department     Pay Rate     Exempt     Hours Worked     Base Pay     Overtime Pay     Total Pay"
```

3. Iterates through the Records and Declares variables
``` js
while read -r empl dept payrate exempt hrs_wrked;
```

4. First group the workers by their exempt status and then by the hours worked :
    - Non exempt workers get base pay for 40 hours and an overtime pay of 1.5 a regular hour
    - Non exempt workers get base pay for the hours they worked under 40 hours
    - Exempt workers get base pay for 40 hours but not overtime pay
    - Exempt workers get base pay for the hours they worked under 40 hours 
    - To know more about [Calculation of Overtime Payment](https://www.indeed.com/career-advice/pay-salary/how-to-calculate-time-and-a-half) visit the site

5. Gets the Input file
``` js
done < EMPLOYEE.txt
```