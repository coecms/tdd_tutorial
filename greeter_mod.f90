module greeter_mod
    implicit none
    contains
        function greeter(cAddressee)
            implicit none
            character(len=*), intent(in), optional :: cAddressee
            character(len=50) :: greeter
            character(len=30) :: myAddressee
            if (present(cAddressee)) then
                myAddressee = cAddressee
            else
                myAddressee = "World"
            end if
            greeter = "Hello " // trim(myAddressee)
        end function greeter
end module greeter_mod
