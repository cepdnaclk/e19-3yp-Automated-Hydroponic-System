import React, {useEffect, useState} from "react";
import alovera_image from "../../../Images/alovera.png";
import strawberry_image from "../../../Images/strawberry.png";
import "./Home_User_New.css";
import Navbar from "../../../components/Navbar/Navbar"


function Home_User_New() {
    /* const [plantData, setPlantData] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/plants/all')
        .then((response) => {
        setPlantData(response.data);
        })   
    }, []);
*/

    const plantData =[ /* Need to change with the database data, once db data is enabled, just delete this */
        {
            name: "Alovera",
            Hardware_setup_id: 1234556,
            image:alovera_image,
        },
        {
            name: "strawberry",
            Hardware_setup_id: 1234557,
            image: strawberry_image,
        },
        {
            name: "Orange",
            Hardware_setup_id: 1234558,
            image: strawberry_image,
        },
        {
            name: "Alovera",
            Hardware_setup_id: 1234559,
            image:alovera_image,
        }
      ]

      return(
        <>
        <Navbar/>
        <div className="main-container row">
            <div className="Home-container row">
                <div className="plant-container ">
                    {plantData.map((plant) => (
                        <div className="plant-card row" key={plant.id}>
                            <div className="plant-image-container col-md-2">
                                <img className="plant-image" src={plant.image} alt={plant.name} />
                            </div>

                            <div className="Plant-data-container col-md-8">
                                <ul>
                                    <li><h2>{plant.name}</h2></li>
                                    <li>{plant.Hardware_setup_id}</li>
                                </ul>
                            </div>

                            <div className="plant-button-container col-md-2">
                                    <button className="btn" style={{backgroundColor:"#0D7817", color:"white"}}>Go</button>
                            </div>
                        </div>      
                    ))}
                </div>
            </div>
            <div className="Add-new-plant-button-container">
                <button className="btn" style={{backgroundColor:"#0D7817", color:"white"}}>Add New Plant</button>
            </div>
        </div>
        </>
      )
      
}

export default Home_User_New;