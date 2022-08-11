package t.jdbc;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

class Student {
	String id;
	String name;
	Address addressS;
	Certificate certificate;

	public Student() {
		super();
	}

	public Student(String id, String name, Address address5, Certificate certificate) {
		super();
		this.id = id;
		this.name = name;
		this.addressS = address5;
		this.certificate = certificate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getAddress() {
		return addressS;
	}

	public void setAddress(Address address5) {
		this.addressS = address5;
	}

	public Certificate getCertificate() {
		return certificate;
	}

	public void setCertificate(Certificate certificate) {
		this.certificate = certificate;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", address=" + addressS + ", certificate=" + certificate + "]";
	}

}

@Component("address")
class Address {
	@Value("mumbai")
	String location;

	public Address() {
		super();
	}

	public Address(String location) {
		super();
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "address [location=" + location + "]";
	}
}

@Component
class Certificate {
	@Value("Master in java")
	String certificateName;

	public Certificate() {
		super();
	}

	public Certificate(String certificateName) {
		super();
		this.certificateName = certificateName;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	@Override
	public String toString() {
		return "Certificate [certificateName=" + certificateName + "]";
	}

}