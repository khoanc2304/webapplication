package model;

import java.sql.Timestamp;

public class Brand {
    private int brandID;
    private String brandName;
    private String brandDescription;
    private Timestamp brandCreatedDate;
    private Timestamp brandUpdatedDate;

    public Brand(int brandID, String brandName, String brandDescription, Timestamp brandCreatedDate, Timestamp brandUpdatedDate) {
        this.brandID = brandID;
        this.brandName = brandName;
        this.brandDescription = brandDescription;
        this.brandCreatedDate = brandCreatedDate;
        this.brandUpdatedDate = brandUpdatedDate;
    }

    public int getBrandID() { return brandID; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
    public String getBrandName() { return brandName; }
    public void setBrandName(String brandName) { this.brandName = brandName; }
    public String getBrandDescription() { return brandDescription; }
    public void setBrandDescription(String brandDescription) { this.brandDescription = brandDescription; }
    public Timestamp getBrandCreatedDate() { return brandCreatedDate; }
    public void setBrandCreatedDate(Timestamp brandCreatedDate) { this.brandCreatedDate = brandCreatedDate; }
    public Timestamp getBrandUpdatedDate() { return brandUpdatedDate; }
    public void setBrandUpdatedDate(Timestamp brandUpdatedDate) { this.brandUpdatedDate = brandUpdatedDate; }

    @Override
    public String toString() {
        return "Brand{" +
                "brandID=" + brandID +
                ", brandName='" + brandName + '\'' +
                ", brandDescription='" + brandDescription + '\'' +
                ", brandCreatedDate=" + brandCreatedDate +
                ", brandUpdatedDate=" + brandUpdatedDate +
                '}';
    }
}
