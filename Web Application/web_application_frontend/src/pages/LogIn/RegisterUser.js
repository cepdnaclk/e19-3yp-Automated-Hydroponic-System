import React, { useState } from "react";
import "./RegisterUser.css";
import CommonNavBar from "../../components/Common_NavBar/Common_Navbar";
import axios from 'axios';
import { useNavigate } from "react-router-dom";
import AdminNavBar from "../../components/Admin_Navbar/AdminNavBar";

function RegisterUser() {
    const [formData, setFormData] = useState({
        firstname: '',
        lastname: '',
        address: '',
        email: '',
        username: '',
        phone: '',
        password: '',
        role: ''
    });

    const [registrationError, setRegistrationError] = useState(null);
    //const navigate = useNavigate();

    const [users, setUsers] = useState([]);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if(formData.password !== formData.confirmPassword){
            alert("Password doesn't match.");
            return;
        }
        try {
            const response = await axios.post('http://localhost:8080/api/v1/auth/register', formData);

            if (response.status === 200) {
                alert("Registration successful");
                //navigate("/LandingPage");
            } else if (response.status === 400) {
                alert("User already exists");
            } else if (response.status === 409) {
                alert("User already registered");
            }
        } catch (error) {
            setRegistrationError('Registration failed. Please check your information.');
        }
    }

    return (
        <>
            <AdminNavBar/>
            <div className="register-container row">
                <div className="register-title row">
                    <h2  style={{color:"rgb(20, 61, 3)"}}>Add a New User</h2>
                </div>
                <div className="register-form row">
                    <form onSubmit={handleSubmit} style={{ marginTop: "1rem" }}>
                        <div className="first-name row">
                            <label htmlFor="firstname" className="form-label col-3">
                                First Name* :
                            </label>
                            <input
                                type="text"
                                name="firstname"
                                className="form-control col"
                                id="firstname"
                                value={formData.firstname}
                                onChange={handleChange}
                                placeholder="Alex"
                                required
                            />
                        </div>
                        <div className="last-name row">
                            <label htmlFor="lastname" className="form-label col-3">
                                Last Name :
                            </label>
                            <input
                                type="text"
                                name="lastname"
                                className="form-control col"
                                id="lastname"
                                value={formData.lastname}
                                onChange={handleChange}
                                placeholder="Williom"
                            />
                        </div>
                        <div className="email row">
                            <label htmlFor="email" className="form-label col-3">
                                Email* :
                            </label>
                            <input
                                type="email"
                                name="email"
                                className="form-control col"
                                id="email"
                                value={formData.email}
                                onChange={handleChange}
                                placeholder="example00@gmail.com"
                                required
                            />
                        </div>

                        <div className="role row">
                            <label htmlFor="role" className="form-label col-3">
                                Role* :
                            </label>
                            <input
                                type="role"
                                name="role"
                                className="form-control col"
                                id="role"
                                value={formData.role}
                                onChange={handleChange}
                                placeholder="USER / ADMIN / MANAGER"
                                required
                            />
                        </div>

                        <div className="password row">
                            <label htmlFor="password" className="form-label col-3">
                                Password* :
                            </label>
                            <input
                                type="password"
                                name="password"
                                className="form-control col"
                                id="password"
                                value={formData.password}
                                onChange={handleChange}
                                placeholder="password@#$%12"
                                required
                            />
                        </div>

                        <div className="confirm-password row">
                            <label htmlFor="confirmPassword" className="form-label col-3">
                                Confirm Password* :
                            </label>
                            <input
                                type="password"
                                name="confirmPassword"
                                className="form-control col"
                                id="confirmPassword"
                                value={formData.confirmPassword}
                                onChange={handleChange}
                                placeholder="password@#$%12"
                                required
                            />
                        </div>
                        <div className="register-button-container row">
                        <button type="submit" className="btn btn-success mt-3" style={{width:"100px",backgroundColor:"#0D7817"}}>Register</button>
                        </div>
                    </form>
                </div>
                <div className="register-title row">
                    <h2  style={{color:"rgb(20, 61, 3)"}}>Existing Users</h2>
                </div>
                <div className="py-4">
                    <table className="table border shadow " style={{width: "80%", height: "fitContent", justifyContent: "center",marginLeft: "10%"}}>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Role</th>
                            <th scope="col">Password</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody className="table-group-divider">
                        {users.map((user, index) => (
                        <tr key={index}>
                            <th scope="row">{index + 1}</th>
                            <td>{user.firstname}</td>
                            <td>{user.lastname}</td>
                            <td>{user.email}</td>
                            <td>{user.role}</td>
                            <td>
                            {/*<Link className="link-dark" onClick={() => deleteSystem(user.id)}>
                                <i className="bi bi-trash fs-5"></i>
                        </Link>*/}
                            </td>
                        </tr> 
                        ))}
                    </tbody>
                    </table>
            </div>
            </div>
        </>
    )
}

export default RegisterUser;
