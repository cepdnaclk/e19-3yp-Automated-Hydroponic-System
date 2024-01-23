import React from "react";
import "./HomePage.css";
import CommonNavBar from "../../../components/Common_NavBar/Common_Navbar";
import Symbol from "../../../Images/symbol.png"

function LandingPage(){
    return(
        <>
        <CommonNavBar/>
        <div className="main-container row">
            <div className="bg-image-container row">
                <div className="text-container row">
                    <br/>
                    <h1 style={{color:"#0D7817"}}>Garden of Tomorrow, Today: Immerse Yourself in the Ease of Automated Hydroponics!</h1>
                </div>
                <div className="secondary-container ">
                    <img src={Symbol} alt="Symbol Loading..." className="symbol-image row" />
                    <button className="join-us-button row">Join Us</button>
                </div>
            </div>
        </div>
        </>
    )
}

export default LandingPage;
