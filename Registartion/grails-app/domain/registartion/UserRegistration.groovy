package registartion

class UserRegistration {
    String firstName
    String lastName
    Date dateOfBirth
    String userName
    String password
    String email
    String address
    static constraints = {
        dateOfBirth(nullable: true)
        email(nullable: true, email: true)
        address(nullable: true)
    }

    static mapping = {
        table 'registration'
    }
}
