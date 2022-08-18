# **ASSIGNMENT 1**
**Documentation for both Questions given below**

---
## Inventory Report Using AWK Script

1. Creates the Title of the Report. ` BEGIN ` executes the codeblock before reading the input file
``` bash
BEGIN{
    for(i=0;i<42;i++) printf("-");
    printf(" INVENTORY REPORT ");
    for(i=0;i<42;i++) printf("-");
    printf("\n\n");}
```

2. Creates all headers
``` bash
    printf("     Part No     Price     Quantity on Hand     Reorder Point     Minimum Order     Order Amount \n");
```

3. Iterates through the Records and Prints them
``` bash
    printf("       %s      %5.2f            %2d                  %2d                %2d               ", $1,$2,$3,$4,$5);
```

4. If Quantity on Hand is less than Reorder Point,
then ` Order Amount = Reorder Point + Minimum Order - Quantity On Hand `
``` bash
    if($3<$4) printf("%2d", $4+$5-$3);
    else printf("-");
    printf("\n");
```

5. Creates End of Report message. ` END ` executes the codeblock after reading the input file
``` bash
END{
    printf("\n");
    for(i=0;i<45;i++) printf("-");
    printf(" END REPORT ");
    for(i=0;i<45;i++) printf("-");
    printf("\n\n");
}
```

6. Note that spacing is provided to align the Fields

7. Run the AWK Script in Linux Terminal using
``` 
awk -f 210101028_Q1.awk INVENTORY.txt
```

---
## Payroll Register Using Bash Script

1. ` # !/bin/bash ` is a [Shebang](https://bash.cyberciti.biz/guide/Shebang) used to tell Linux OS the path to Bash interpreter

2. Creates the Title of the Register. ` -n ` prevents a newline character
``` bash
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

3. Creates all Headers
``` bash
echo "     Employee No    Department     Pay Rate     Exempt     Hours Worked     Base Pay     Overtime Pay     Total Pay"
```

4. Iterates through the Records and Declares variables. ` -r ` helps in reading the entire line ignoring escape characters
``` bash
while read -r empl dept payrate exempt hrs_wrked;
```

5. First group the workers by their exempt status and then by the hours worked :
    - Non exempt workers, who worked over 40 hours, get base pay for 40 hours and an overtime pay of 1.5 a regular hour for the rest of the hours
    - Non exempt workers,who worked under 40 hours, get base pay for the hours they worked
    ``` bash
    if [ $exempt == "N" ]
    then
        if [ $hrs_wrked -gt 40 ]
        then
            base=$(echo "scale=4; $payrate*40" | bc);
            overtime=$(echo "scale=4; 1.5*$payrate*($hrs_wrked-40)" | bc);
            total=$(echo "scale=4; $base+$overtime" | bc);
        else
            base=$(echo "scale=4; $payrate*$hrs_wrked" | bc);
            overtime=0.0;
            total=$base;
        fi
    ```
    - Exempt workers, who worked over 40 hours, get base pay for 40 hours but not overtime pay
    - Exempt workers, who worked under 40 hours, get base pay for the hours they worked
    ``` bash
    else
    if [ $hrs_wrked -gt 40 ]
    then
        base=$(echo "scale=4; $payrate*40" | bc);
    else
        base=$(echo "scale=4; $payrate*$hrs_wrked" | bc);
    fi
    overtime=" Nil ";
    total=$base;
    ```
    - To know more about [Calculation of Overtime Payment](https://www.indeed.com/career-advice/pay-salary/how-to-calculate-time-and-a-half) visit the site

6. Note that spacing is provided to left justify _Employee numbers_ and align the Fields

7. Gets the Input file
``` bash
done < EMPLOYEE.txt
```

8. Run the Bash Script in Linux Terminal using
```
chmod +x 210101028_Q2.sh
./210101028_Q2.sh
```