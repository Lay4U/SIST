
/*
* * * * * * ==================================                          
 * * * * *  ==================================                          
* * * * * * ==================================                          
 * * * * *  ==================================                          
* * * * * * ==================================                          
 * * * * *  ==================================                          
* * * * * * ==================================                          
 * * * * *  ==================================                          
* * * * * * ==================================                          
==============================================                          
==============================================                          
==============================================                          
==============================================                          
==============================================                          
==============================================
*/

public class Ex{
    public static void main(String[] args) throws Exception{
        int odd = 0;
        for(int i=0; i<9; i++)
        {
            if(odd % 2 == 0)
                {
                    System.out.print("* * * * * * ==================================");
                }
            else
                {
                    System.out.print(" * * * * *  ==================================");
                }
                System.out.println();
            
            odd++;
        }
        
        for(int i=0; i<5; i++)
        {
            System.out.println("==============================================");
        }

    }
}
