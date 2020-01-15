--1. List each employee first name, last name and supervisor 
--status along with their department name. Order by department name, 
--then by employee last name, and finally by employee first name.

--1. 
    --Select e.FirstName, e.LastName, e.IsSupervisor, d.Name as DepartmentName 
    --from Employee e Left Join Department d on d.Id = e.DepartmentId 
    --Order By d.Name, LastName, FirstName;

--2.List each department ordered by budget amount with the highest first.

--2.
    --SELECT * FROM Department 
    --ORDER BY Budget DESC

--3.List each department name along with any employees (full name) in that department who are supervisors.
    
 --3. 
      --SELECT d.Name as DepartmentName, e.FirstName, e.LastName, IsSupervisor
      --FROM Employee e LEFT JOIN Department d on d.Id = e.DepartmentId
      --WHERE IsSupervisor = 1

  --4. List each department name along with a count of employees in each department.
       
      --4.
        --SELECT d.Name as DepartmentName, COUNT (DepartmentId) as EmployeeCount
       --FROM Department d JOIN Employee e
       --ON d.Id = e.DepartmentId
       --GROUP BY [Name]

    --5. Write a single update statement to increase each department's budget by 20%

        --UPDATE Department
        --SET Budget += Budget * 0.2;

    --6. List the employee full names for employees who are not signed up for any training programs.

          --6. --SELECT e.Id, e.FirstName, e.LastName, COUNT(EmployeeId) AS TrainingCount
           -- FROM Employee e
           -- LEFT JOIN EmployeeTraining ON e.Id = EmployeeId
           -- GROUP BY e.Id, e.FirstName, e.LastName
           -- HAVING COUNT(EmployeeId) = 0;
    
    --7. List the employee full names for employees who are signed up for at least one training program 
        --and include the number of training programs they are signed up for.

           --7. SELECT e.Id, e.FirstName, e.LastName, COUNT(EmployeeId) as TrainingCount
           -- FROM Employee e
           -- LEFT JOIN EmployeeTraining ON e.Id = EmployeeId
           -- GROUP BY e.Id, e.FirstName, e.LastName
           -- HAVING COUNT (EmployeeId) > 0;

    --8. List all training programs along with the count employees who have signed up for each.

          --8. SELECT Name, e.Id, e.FirstName, e.LastName, COUNT(EmployeeId) as TrainingCount
           --From Employee e
           --LEFT JOIN EmployeeTraining ON e.Id = EmployeeId
           --LEFT JOIN TrainingProgram t ON t.Id = TrainingProgramId
           --Group BY e.Id, e.FirstName, e.LastName, Name
           --HAVING Count(EmployeeId) >= 1

   --9. List all training programs who have no more seats available.

            --9. SELECT  [Name], MaxAttendees, COUNT(TrainingProgramId) as TrainingCount
            --From Employee e
            --LEFT JOIN EmployeeTraining ON e.Id = TrainingProgramId
            --Left JOIN TrainingProgram t ON t.Id = TrainingProgramId
            --GROUP BY e.Id, Name, MaxAttendees
            --HAVING COUNT(TrainingProgramId) >= MaxAttendees

    --10.  List all future training programs ordered by start date with the earliest date first.
           
           --SELECT StartDate, EndDate, Name, MaxAttendees
           --From TrainingProgram
           --WHERE StartDate > GetDate() 
           --ORDER BY StartDate

    --11. Assign a few employees to training programs of your choice.

            --INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
            --VALUES (11, 16)
            --INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
            --VALUES (12, 15)
            --INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId)
            --VALUES ( 13, 14)

    --12.  List the top 3 most popular training programs. (For this question, 
           --consider each record in the training program table to be a UNIQUE training program).

           --SELECT top 3 t.[Name], COUNT(e.Id) AS AttendeeCount
           --FROM EmployeeTraining e
           --LEFT JOIN TrainingProgram t ON t.Id = e.TrainingProgramId
           --GROUP BY t.Id, t.[Name]
           --ORDER BY COUNT(e.Id) DESC

    --13.  List the top 3 most popular training programs. (For this question consider training programs 
           --with the same name to be the SAME training program).

           -- SELECT top 3 t.[Name], COUNT(e.Id) AS AttendeeCount
           --FROM EmployeeTraining e
           --LEFT JOIN TrainingProgram t ON t.Id = e.TrainingProgramId
           --GROUP BY  t.[Name]
           --ORDER BY COUNT(e.Id) DESC

     --14   List all employees who do not have computers.

             --SELECT e.FirstName, e.LastName, ce.Id
             --FROM Employee e
             --Left JOIN ComputerEmployee ce ON e.Id = ce.EmployeeId
             --WHERE ce.Id is Null;

     --15. List all employees along with their current computer information make and manufacturer combined into a field entitled ComputerInfo. If they do not have a computer, this field should say "N/A".
               
               --SELECT e.FirstName, e.LastName, IsNull(c.Make + ' ' + c.Manufacturer, 'N/A') AS ComputerInfo
               --From Employee e
               --LEFT JOIN ComputerEmployee ce ON e.Id = ce.EmployeeId
               --LEFT JOIN Computer c ON ce.ComputerId = c.Id
     
     
     --16. List all computers that were purchased before July 2019 that are have not been decommissioned.
                
                --SELECT c.Id, c.Make, c.Manufacturer, c.PurchaseDate, c.DecomissionDate
                --FROM Computer c
                --WHERE c.PurchaseDate < FORMAT(CURRENT_TIMESTAMP, '07-01-2019')
                --AND DecomissionDate is NULL


     --17. List all employees along with the total number of computers they have ever had.

                --SELECT  e.FirstName,  COUNT(ce.EmployeeId) as 'Total Computers'
                --FROM Employee e
                --LEFT JOIN ComputerEmployee ce ON e.Id = ce.EmployeeId
                --GROUP BY e.FirstName
                --HAVING COUNT(ce.EmployeeId) Is Not NULL
                 

     --18. List the number of customers using each payment type

                --SELECT COUNT(c.Id) AS 'Customer',  p.[Name] 
                --FROM Customer c
                --LEFT JOIN PaymentType p ON c.Id = p.CustomerId
                --GROUP BY p.[Name]
                --HAVING COUNT(c.Id) Is Not Null
      
     --19. List the 10 most expensive products and the names of the seller

                --SELECT top 10 p.Price, c.FirstName, c.LastName, p.Price
                --FROM Product p 
                --LEFT JOIN Customer c ON  c.Id = p.CustomerId
                --ORDER BY p.Price DESC
                


     --20. List the 10 most purchased products and the names of the seller
                
                --SELECT top 10 c.FirstName, c.LastName, p.Quantity
                --FROM Product p 
                --LEFT JOIN Customer c ON  c.Id = p.CustomerId
                --ORDER BY p.Quantity DESC

     --21. Find the name of the customer who has made the most purchases

                  --SELECT top 1 COUNT(o.CustomerId) AS 'Total Orders', c.FirstName AS 'First Name'
                  --FROM Customer c
                  --LEFT JOIN [Order] o ON c.Id = o.CustomerId
                  --GROUP BY c.FirstName
                  --ORDER BY Count(o.CustomerId) DESC

     
     
     --22. List the amount of total sales by product type

                --SELECT pt.Id, pt.[Name], COUNT(p.ProductTypeId) AS 'Total Orders'
                --FROM OrderProduct op
                --LEFT JOIN Product p ON p.Id = op.ProductId
                --LEFT JOIN ProductType pt ON pt.Id = p.ProductTypeId
                --GROUP BY pt.Id, pt.[Name]
                --ORDER BY COUNT(p.ProductTypeId) DESC


       --23. List the total amount made from all sellers

                SELECT c.FirstName + ' ' + c.LastName AS SellerName, IsNull(SUM(sales.Price),0) as TotalAmount 
                FROM Customer c
                LEFT JOIN (SELECT p.Price, p.CustomerId 
                FROM Product p 
                INNER JOIN OrderProduct op ON op.ProductId = p.Id)
                Sales ON Sales.CustomerId = c.Id
                Group By c.FirstName,c.LastName
                Order By c.FirstName
