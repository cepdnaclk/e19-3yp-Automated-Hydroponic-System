import React, { useEffect, useState } from "react";
import alovera_image from "../../Images/alovera.png";
import strawberry_image from "../../Images/strawberry.png";
import "../Users Home/Home_User.css"

function Home_User(){
/* const [plantData, setPlantData] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/plants/all')
        .then((response) => {
        setPlantData(response.data);
        })   
    }, []);
*/



      const plantData =[
        {
            name: "Alovera",
            Hardware_setup_id: 1234556,
            image:alovera_image,
        },
        {
            name: "strawberry",
            Hardware_setup_id: 1234557,
            image: strawberry_image,
        }
      ]
    


    return(
        <>
        <div className="parent-container">
            <div className="container">
            <div className="plant-container col">
                {plantData.map((Plant) => (
                    <div className="row plant-card-items " key={Plant.id}>
                        <div className="col plant-image">
                            <img src={Plant.image} alt={Plant.name} style={{height: "150px", width: "150px",margin:"0px"}} />
                            {/*<img src={`data:Plant/jpeg;base64,${Plant.image}`} />*/}
                        </div>
                        
                        <div className="col plant-data">
                            <ul>
                                <li><h2>{Plant.name}</h2></li>
                                <li>{Plant.Hardware_setup_id}</li>
                            </ul>
                        </div>

                        <div className="col plant-button">
                            <button className="btn btn-success">Go</button>
                        </div>
                        
                    </div>
                ))}
        </div>
            </div>

        </div>
         

        </>
    )
}
export default Home_User;