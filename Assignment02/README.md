# **ASSIGNMENT 2**
**Documentation for both Questions given below**

---
## Backup System Using Bash Script

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
## Random String Generator Using Perl Script

1. ` # !/bin/bash/perl ` is a [Shebang](https://bash.cyberciti.biz/guide/Shebang) used to tell Linux OS the path to Bash interpreter

2. Open the given text file to read the string of characters for string generation. If the file does not exist terminate the process.

3. Read the values of count and length from the terminal.

4. Trim the newline character at the end, which was read while taking input.

5. Split the string into an array of characters. Calculate the number of characters used for string generation.

6. Create a do-while loop to generate any permutation of string with given parameters.

7. mylen is the length of generated string at any instance. When mylen is equal to length given, terminate the loop.

8. When the difference between length and mylen is smaller than count, larger values of count cannot be used for substring generation. Hence count is decremented to the difference.

9. Random character from the array is chosen for substring generation.

10. If the chosen character is not same as previous chosen character, generate a substring of length less than count.

11. Ask the user if another permutation is need. If not, terminate the process.

