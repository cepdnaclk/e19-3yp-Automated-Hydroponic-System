import React, {useEffect, useState} from "react";
import SYSTEM_IMAGE from "../../../Images/System.jpg"
import "./AdminHome.css";
import AdminNavBar from "../../../components/Admin_Navbar/AdminNavBar";


function AdminHome() {
    /* const [systemData, setSystemData] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/system/all')
        .then((response) => {
        setSystemData(response.data);
        })   
    }, []);
*/

    const systemData =[ /* Need to change with the database data, once db data is enabled, just delete this */
        {
            name: "user01@gmail.com",
            Hardware_setup_id: 1234556,
        },  
        {
            name: "user02@gmail.com",
            Hardware_setup_id: 1234557, 
        },
        {
            name: "user03@gmail.com",
            Hardware_setup_id: 1234558,
        },
        {
            name: "user04@gmail.com",
            Hardware_setup_id: 1234559,
        }
      ]

      return(
        <>
        <AdminNavBar/> 
        <div className="main-container row">
            <div className="Home-container row">
                <div className="plant-container row">
                    <br></br>
                    <h1>Exsisting Systems</h1>
                    {systemData.map((system) => (
                        <div className="plant-card row" key={system.id}>
                            <div className="plant-image-container col-md-2">
                                <img className="plant-image" src={SYSTEM_IMAGE} />
                            </div>

                            <div className="plAnt-data-container col-md-8">
                                <ul>
                                    <li><h4> System ID : {system.Hardware_setup_id}</h4></li>
                                    <li>User Name : {system.name}</li>
                                </ul>
                            </div>

                            <div className="plant-button-container col-md-2">
                                    <button className="btn" style={{backgroundColor:"#0D7817", color:"white"}}>Go</button>
                            </div>
                        </div>      
                    ))}
                </div>
            </div>
        </div>
        </>
      )
      
}

export default AdminHome;