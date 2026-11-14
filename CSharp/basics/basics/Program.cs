
Console.WriteLine("Hello, 2510B1!");

//DATATYPES

////STRING

//string userName = "Zaryab";

//char bloodGroup = 'B';

//Console.WriteLine(userName + " has blood group: " + bloodGroup);

////numbers

//byte age = 45;

//int idNum = 557;

//long largeNum = 1314546726374356743L;

//float height = 5.7F;

//double dNum = 998.54D;

//decimal deciNum = 78900.450M;

////Bool

//bool isValid = true;

//Console.WriteLine(age);

////Arithematic Operators

//Console.WriteLine(76 + 90);
//Console.WriteLine(176 - 90);
//Console.WriteLine(6 * 9);
//Console.WriteLine(75 / 5);
//Console.WriteLine(77 % 5);


////Assignment Operators

//int num = 12;

//Console.WriteLine(num += 4); //num = num + 4 
//Console.WriteLine(num -= 4); //num = num - 4 
//Console.WriteLine(num *= 4); //num = num * 4 
//Console.WriteLine(num /= 4); //num = num / 4 
//Console.WriteLine(num %= 4); //num = num % 4 


//Comparision Operators

int a = 45; int b = 75;

//Console.WriteLine(a == b); //F
//Console.WriteLine(a != b); //T
//Console.WriteLine(a <= b); //T
//Console.WriteLine(a >= b); //F
//Console.WriteLine(a > b); //F
//Console.WriteLine(a < b); //T


//LOGICAL OPERATORS (AND &&, OR ||, NOT !)
////AND
//// T     T  = T
//// T     F  = F
//// F     T  = F
//// F     F  = F
//Console.Write(a <= b && a != b);// T
//Console.Write(a >= b && a != b);// F


////OR
//// T     T  = T
//// T     F  = T
//// F     T  = T
//// F     F  = F
//Console.WriteLine(a <= b || a != b); //T
//Console.WriteLine(a >= b || a != b); //T
//Console.WriteLine(a >= b || a == b); //F

////NOT !

Console.WriteLine(!(a == b));
Console.WriteLine(a != b);

// Salary System

Console.WriteLine("Enter salary...");

int salary = Int32.Parse(Console.ReadLine());

//Console.WriteLine("Your salary: " + salary);

if(salary > 100000 && !(salary >= 140000))
{
    Console.WriteLine("Good Salary Package");
}
else if(salary < 100000)
{
    Console.WriteLine("Do you get fuel allowance");
    string answer = Console.ReadLine();

    answer = answer.ToLower();

    if(answer == "yes" || answer == "y")
    {
        Console.WriteLine("Achi bat he!");
    }
    else if(answer == "no" || answer == "n")
    {
        Console.WriteLine("Try to switch your Job asap!");
    }
    else
    {
        Console.WriteLine("Please enter yes or no.");
    }
}
else
{
    Console.WriteLine("MASHALLAH!");
}












