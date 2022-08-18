# Run the Bash Script in Linux Terminal using
# chmod +x 210101028_Q2.sh
# ./210101028_Q2.sh

# !/bin/bash

# Header
for i in {1..51}
do
    echo -n "-"
done
echo -n " PAYROLL REGISTER "
for i in {1..51}
do
    echo -n "-"
done

printf "\n\n"
# Field Names
echo "     Employee No    Department     Pay Rate     Exempt     Hours Worked     Base Pay     Overtime Pay     Total Pay"

# Reads line by line and stores in variables
while read -r empl dept payrate exempt hrs_wrked;
do
    # For logic of calculation, refers README file
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
        printf "     %s               %d           %.2f          %c            %d           %.2f          %5.2f          %.2f \n" "$empl" "$dept" "$payrate" "$exempt" "$hrs_wrked" "$base" "$overtime" "$total";
    else
        if [ $hrs_wrked -gt 40 ]
        then
            base=$(echo "scale=4; $payrate*40" | bc);
        else
            base=$(echo "scale=4; $payrate*$hrs_wrked" | bc);
        fi
        overtime=" Nil ";
        total=$base;
        printf "     %s               %d           %.2f          %c            %d           %.2f          %s          %.2f \n" "$empl" "$dept" "$payrate" "$exempt" "$hrs_wrked" "$base" "$overtime" "$total";
    fi
# Input file is scanned
done < EMPLOYEE.txt

# Bottom line
for i in {1..120}
do
    echo -n "-"
done
printf "\n"