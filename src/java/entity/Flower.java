
package entity;

/**
 *
 * @author hoangdeptraivodich
 */
public class Flower {
    private String code;
    private String type;
    private String name;
    private String image;
    private float price;

    public Flower() {
    }

    public Flower(String code, String type, String name, String image, float price) {
        this.code = code;
        this.type = type;
        this.name = name;
        this.image = image;
        this.price = price;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
