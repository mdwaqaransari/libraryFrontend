package entity;

public class Book {
	private int id;
	private String code;
	private String name;
	private String author;
	private String dateAdded;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", code=" + code + ", name=" + name + ", author=" + author + "]";
	}
	
	

}
