class Employee
    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        boss.employees << self if boss
    end

    def bonus(multiplier)
        salary * multiplier
    end
    
    protected

    attr_reader :salary
end

class Manager < Employee
    def initialize(name, title, salary, boss, employees = [])
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        salary_of_subs * multiplier
    end

    attr_reader :employees
    protected 
    def salary_of_subs
        total=0
        employees.each do |emp|
            case emp
            when Manager
                return emp.salary + emp.salary_of_subs
            else
                total+=emp.salary
            end
        end
        total
    end
end
