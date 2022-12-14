package detail;

public class Cart {
   private int cid;
   private int uid;
   private int pid;
   private int quantity;
   private int stotal;

   public Cart() {
      super();
   }

   public Cart(int cid, int uid, int pid, int quantity, int stotal) {
      super();
      this.cid = cid;
      this.uid = uid;
      this.pid = pid;
      this.quantity = quantity;
      this.stotal = stotal;
   }

   public int getCid() {
      return cid;
   }

   public void setCid(int cid) {
      this.cid = cid;
   }

   public int getUid() {
      return uid;
   }

   public void setUid(int uid) {
      this.uid = uid;
   }

   public int getPid() {
      return pid;
   }

   public void setPid(int pid) {
      this.pid = pid;
   }

   public int getQuantity() {
      return quantity;
   }

   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }

   public int getStotal() {
      return stotal;
   }

   public void setStotal(int stotal) {
      this.stotal = stotal;
   }
}
