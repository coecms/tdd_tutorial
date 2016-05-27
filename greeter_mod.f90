module greeter_mod
    implicit none
    contains
        function greeter(cAddressee)
            implicit none
            character(len=*), intent(in), optional :: cAddressee
            character(len=50) :: greeter
            greeter = "Hello World"
        end function greeter
end module greeter_mod
