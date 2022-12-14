package detail;

import java.util.Date;

public class User {
   private int id;
   private String fname;
   private String lname;
   private String email;
   private String pass;
   private String number;
   private String address;
   private String state;
   private String city;
   private int zip;
   private Date date;

   public User() {
      super();
   }

   public User(String fname, String lname, String email, String pass, String number, String address, String state,
         String city, int zip) {
      super();
      this.fname = fname;
      this.lname = lname;
      this.email = email;
      this.pass = pass;
      this.number = number;
      this.address = address;
      this.state = state;
      this.city = city;
      this.zip = zip;
   }

   public User(int id, String fname, String lname, String email, String pass, String number, String address,
         String state, String city, int zip, Date date) {
      super();
      this.id = id;
      this.fname = fname;
      this.lname = lname;
      this.email = email;
      this.pass = pass;
      this.number = number;
      this.address = address;
      this.state = state;
      this.city = city;
      this.zip = zip;
      this.date = date;
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getFname() {
      return fname;
   }

   public void setFname(String fname) {
      this.fname = fname;
   }

   public String getLname() {
      return lname;
   }

   public void setLname(String lname) {
      this.lname = lname;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPass() {
      return pass;
   }

   public void setPass(String pass) {
      this.pass = pass;
   }

   public String getNumber() {
      return number;
   }

   public void setNumber(String number) {
      this.number = number;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getState() {
      return state;
   }

   public void setState(String state) {
      this.state = state;
   }

   public String getCity() {
      return city;
   }

   public void setCity(String city) {
      this.city = city;
   }

   public int getZip() {
      return zip;
   }

   public void setZip(int zip) {
      this.zip = zip;
   }

   public Date getDate() {
      return date;
   }

   public void setDate(Date date) {
      this.date = date;
   }

}
