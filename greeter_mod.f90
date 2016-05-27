module greeter_mod
    implicit none
    contains
        function greeter(cAddressee, cGreeting)
            implicit none
            character(len=*), intent(in), optional :: cAddressee, cGreeting
            character(len=50) :: greeter
            character(len=30) :: myAddressee
            character(len=20) :: myGreeting
            if (present(cGreeting)) then
                myGreeting = cGreeting
            else
                myGreeting = "hello"
            end if
            if (present(cAddressee)) then
                myAddressee = cAddressee
            else
                myAddressee = "World"
            end if
            greeter = trim(myGreeting) // " " // trim(myAddressee)
        end function greeter
end module greeter_mod
