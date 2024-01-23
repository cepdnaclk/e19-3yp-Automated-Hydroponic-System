import React, { useEffect, useState } from "react";
import "./systems.css";
import AdminNavBar from "../../components/Admin_Navbar/AdminNavBar";
import axios from 'axios';
import { useParams, Link } from "react-router-dom";



function Systems(){
    const [systemData, setSystemData] = useState({
        systemid: '',
        firstname: '',
        lastname: '',
        email: '',
        username: ''    
    });

    const [systems, setSystems] = useState([]);

    useEffect(() => {
        getAllSystems();
    },[]);

    const getAllSystems = async () => {
        const response = await axios.get("http://localhost:8080/api/v1/auth/systems/all");
        setSystems(response.data);
    }

    const {id} = useParams();

    const deleteSystem = async (id) => {
        await axios.delete(`http://localhost:8080/api/v1/auth/systems/${id}`);
        getAllSystems();
    }

    const handleChange = (e) => {
        const { name, value } = e.target;
        setSystemData({ ...systemData, [name]: value });
    };
    
    const handleSubmit = async (e) => {
        e.preventDefault();

        const systemDataToSend = new FormData();
        for (const key in systemData) {
            systemDataToSend.append(key, systemData[key]);
        }

        try {
            const response = await axios.post(
            "http://localhost:8080/api/v1/auth/systems/add",
            systemDataToSend,
            {
                headers: {
                "Content-Type": "multipart/form-data", // Important for file upload
                },
            }
            );

            // Handle the response from the backend (e.g., show success message)
            console.log(response.data);

            // Clear the form fields after successful submission
            setSystemData({
                systemid: '',
                firstname: '',
                lastname: '',
                email: '',
                username: ''
            });
        } catch (error) {
            // Handle errors (e.g., show error message)
            console.error("Error in adding new system:", error);
        }
    };

    return (
        <>
            <AdminNavBar/>
            <div className="system-container row">
                <div className="system-title row">
                    <h2  style={{color:"rgb(20, 61, 3)"}}>Add New System</h2>
                </div>
                <div className="system-form row">
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
                                value={systemData.firstname}
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
                                value={systemData.lastname}
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
                                value={systemData.email}
                                onChange={handleChange}
                                placeholder="example00@gmail.com"
                                required
                            />
                        </div>
                        <div className="system-id row">
                            <label htmlFor="systemid" className="form-label col-3">
                                System ID :
                            </label>
                            <input
                                type="text"
                                name="systemid"
                                className="form-control col"
                                id="systemid"
                                value={systemData.systemid}
                                onChange={handleChange}
                                placeholder="xyz123#$%"
                            />
                        </div>

                        <div className="system-button-container row">
                        <button type="submit" className="btn btn-success mt-3" style={{width:"200px",backgroundColor:"#0D7817"}}>Add System</button>
                        </div>
                    </form>
                </div>
            </div>

            <div className="py-4">
                    <table className="table border shadow " style={{width: "80%", height: "fitContent", justifyContent: "center",marginLeft: "10%"}}>
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">System ID</th>
                        <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody className="table-group-divider">
                        {systems.map((system, index) => (
                        <tr key={index}>
                            <th scope="row">{index + 1}</th>
                            <td>{system.firstname}</td>
                            <td>{system.lastname}</td>
                            <td>{system.email}</td>
                            <td>{system.systemid}</td>
                            <td>
                            <Link className="link-dark" onClick={() => deleteSystem(system.id)}>
                                <i className="bi bi-trash fs-5"></i>
                            </Link>
                            </td>
                        </tr> 
                        ))}
                    </tbody>
                    </table>
            </div>
        </>
    )

}
export default Systems;