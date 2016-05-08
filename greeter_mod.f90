module greeter_mod
    implicit none
    contains
        function greeter()
            implicit none
            character(len=50) :: greeter
            greeter = ""
        end function greeter
end module greeter_mod
