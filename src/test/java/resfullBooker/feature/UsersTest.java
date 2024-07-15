package resfullBooker.feature;

import com.intuit.karate.junit5.Karate;

class UsersTest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Auth.feature","ConsultaBooking.feature","CrearBooking.feature","ActualizacionBooking.feature","DeleteBooking.feature","Ping.feature").relativeTo(getClass());
    }    

}
