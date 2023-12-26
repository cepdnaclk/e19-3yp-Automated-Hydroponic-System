import React, { useEffect, useState } from "react";
import "./Plant_Details.css";
import Navbar from "../../components/Navbar/Navbar"
import alovera_image from "../../Images/alovera.png"
import SearchBar from "../../components/Search/Searchbar"

function PlantDetails(){
   /*
    const [plantDatas, setPlantDatas] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/plantDatas/all')
        .then((response) => {
            setPlantDatas(response.data);
        })
    },[]);

    const plantData = plantDatas.filter(
        (plant) => plant.name ===      #Need to add the value that is passed with the button click
    )
*/ 
    const plantData =/* Need to change with the database data, once db data is enabled, just delete this */
        {
            name: "Aloe Vera",
            image:alovera_image,
            details:"Aloe Vera, a versatile succulent, is cherished for its soothing gel, derived from its fleshy leaves. This gel is a natural remedy for sunburn and skin irritations, providing relief and promoting healing. Aloe Vera also serves as a moisturizer, enhancing skin hydration, and its antibacterial properties aid in wound healing. It's a go-to ingredient for skincare products and hair car solutions. As a low-maintenance houseplant, Aloe Vera brings its practicality and aesthetic appeal to homes, thriving in well-draining soil and indirect sunlight while requiring minimal watering to thrive."
        }

    return(
        <>
        <Navbar/>
        <div className="plant-details col">
            <div className="search-bar-conatiner row">
                <SearchBar/>
            </div>

            <div className="data-container row">
                <div className="plant-image-container col-md-6">
                    <h3><b>{plantData.name}</b></h3>
                    <img id="plant-image" src={plantData.image} alt={plantData.name}/>
                </div>
                <div className="plant-data-container col-md-6">
                <div className="plant-data-inner-container">
                    <div style={{margin:"20px"}}>
                        <h6>Details</h6>
                        <p>{plantData.details}</p>
                    </div>
                </div>
                </div>    
            </div>
        </div>
        </>
    )


}

export default PlantDetails;