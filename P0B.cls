/////////////////////////////////////////////////////////////////
//
// Name: Project 0 Bravo
// Author: Akeem Shane (awshane420@gmail.com)
// Date: 02/24/2020
// Description: Series of apex methods to demonstrate
// basic understanding of coding concepts.
//
/////////////////////////////////////////////////////////////////

public class P0B {
    
    // Returns the nth number in the Fibonnaci sequence using recursion
	public static Integer nFibonnaci(Integer n)
    {
        if(n == 0) return 0;
        if(n == 1) return 1;
        
        return nFibonnaci(n - 1) + nFibonnaci(n - 2); //recursive algorithm.
    }
    
    //Returns a sorted integer array/list using bubblesort
    public static Integer[] sortArray(Integer[] intList)
    {
        Integer temp = 0;
        Boolean sorted = false;
        
        //Sorting Algorithm.
        while(!sorted)
        {
            sorted = true; //assuming that the list is sorted.
            for(Integer i = 0; i < intList.size() - 1; i++)
        	{
           		if(intList[i] > intList[i + 1])
            	{
                	temp = intList[i];
                	intList[i] = intList[i + 1];
                	intList[i + 1] = temp;
                    sorted = false; //assumes the list is still unsorted.
            	}
        	}          
        }
        return intList;
    }
    
    //Returns the factorial of the integer using recursion.
    public static Integer nFactorial(Integer n)
    {
        if(n == 0 || n == 1) return 1; //Base case.
        
        return n * nFactorial(n - 1); //recursive algorithm.
    }
    
    //Shifts the elements in an Array left by the specified number of times. 
    public static Integer[] rotateLeftNTimes(Integer[] iArray, Integer n)
    {
        Integer remainder, length = iArray.size();
        Integer[] shiftedArray = new Integer[length];
        
        /* If n is greater than the lenght of the array, sets n to the difference.
         * This is allowed because if we shift the elements of the array by the size of the
         * array then all the elements would be in the same position. Thus the remainder 
         * will be the required shifts necessary. 
		 */
        while(n >= length) n-= length;
        //If the elements shifted to left is 0 return the array.
        if(n == 0) return iArray;
                    
        for(Integer i = 0; i < length; i++)
        {
            /* Determines if the element to be shifted left is out-of-bounds 
			 * and if so then count from the right the new position. Else insert
			 * into the new array normally.
			 */
           if(i - n < 0)
           {
               shiftedArray[length - (n - i)] = iArray[i]; 
           }
           else
           {
            	shiftedArray[i - n] = iArray[i];    
           }
        }      
        return shiftedArray;
    }
    /* Determines if a string of brackets are balanced or not. 
     */
    public static Boolean bracketsAreBalanced(String s)
    {
        //String of an odd length isn't a balanced string. 
        if(isOdd(s.length())) return false;
        //These indexers are used to the track the closing brackets '), ], }'
        Integer parenthesesIndexer, curlyIndexer, squareIndexer;
        parenthesesIndexer = curlyIndexer = squareIndexer = 0;
        
        Boolean isBalanced;
        
        for(Integer i = 0; i < s.length(); i++)
        {
            switch on s.charAt(i)
            {
                when 40
                {    
                    //In the case the char is '(' find the closing bracket and determine if it's balanced.
                    parenthesesIndexer = s.indexOfChar(41,parenthesesIndexer);
                    isBalanced = parenthesesIndexer  > -1 ? isOdd(parenthesesIndexer - i): false;
                    parenthesesIndexer++;
                }
                when 91
                {	
                    //In the case the char is '[' find the closing bracket and determine if it's balanced. 
                    squareIndexer = s.indexOfChar(93,squareIndexer);
                    isBalanced = squareIndexer > -1 ? isOdd(squareIndexer - i): false;
                    squareIndexer++;
                }
                when 123
                {
                    //In the case the char is '{' find the closing bracket and determine if it's balanced.
                    curlyIndexer = s.indexOfChar(125,curlyIndexer);
                    isBalanced = curlyIndexer > -1 ? isOdd(curlyIndexer - i): false;
                    curlyIndexer++;
                    
                }
                when 41, 93, 125 { continue;} //skip all the closing brackets '), ], }'
                when else { break; }
            }
        }       
        return isBalanced;
    }
	//This method is used for the the brackertsAreBalanced method, returns true if an odd number is passed.
    public static Boolean isOdd(Integer n)
    {
        Decimal r = (Decimal) n; 
        n /= 2; 
        r /= (Decimal) 2;
        
        if(n == r) return false; //If both number being returned are integers then the number is an even number.
       	else return true; 
    }
    
    public static void updateAccountSize()
    {
		List<Account> accounts = [SELECT Name, Size__c,NumberOfEmployees FROM Account];
        
        for(Account acc : accounts)
        {
            if(1 <= acc.NumberOfEmployees && acc.NumberOfEmployees <= 1000) acc.Size__c = 'small';
            
            if(1001 <= acc.NumberOfEmployees && acc.NumberOfEmployees <= 10000) acc.Size__c = 'medium';
            
            if(10000 < acc.NumberOfEmployees) acc.Size__c = 'large';
            
			System.debug(acc.Name + ' ' + acc.Size__c + ' ' + acc.NumberOfEmployees);			            
        }
        
        
    }   
}