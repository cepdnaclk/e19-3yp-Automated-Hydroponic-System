import React from "react";
import "./page_04.css";
import Navbar from "../../components/Navbar/Navbar";
import Symbol from "../../Images/symbol.png"

function PageFour(){
    return(
        <>
        <Navbar/>
        <div className="main-container row">
            <div className="bg-image-container row">
                <div className="text-container row">
                    <h1 style={{color:"#0D7817"}}>Want An Automated Hydroponic System?</h1>
                </div>
                <div className="secondary-container ">
                    <img src={Symbol} alt="Symbol Loading..." className="symbol-image row"/>
                    <button className="join-us-button row">Join Us</button>
                </div>
            </div>
        </div>
        </>
    )
}

export default PageFour;
