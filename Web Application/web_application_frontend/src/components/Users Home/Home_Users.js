import React, { useState } from "react";
import "./Home_users.css";
import LOGO from "../../Images/Logo.png";


function UserHome() {
    const [showOffcanvas, setShowOffcanvas] = useState(false);

    const toggleOffcanvas = () => {
        setShowOffcanvas(!showOffcanvas);
    };
    return (
        <>
        <div className="user-home-container">
            <nav className="navbar navbar-expand-sm custom-navbar-color custom-rounded ">
                <div className="container-fluid">
                    
                    <div>
                        <a className="logo-home-button" href="/">
                            <img className="responsive-logo" src={LOGO} alt="Hydro grow pro logo"/>
                        </a>
                    </div>

                    <div className="collapse navbar-collapse custom-display" id="navbarNav">
                        <ul className="navbar-nav ms-auto">
                            <li className="nav-item me-3">
                            <a className="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li className="nav-item me-3">
                            <a className="nav-link" href="#">Plant Details</a>
                            </li>
                            <li className="nav-item me-3">
                            <a className="nav-link" href="#">Data Analytics</a>
                            </li>
                            <li className="nav-item me-3">
                            <a className="nav-link" href="#">Login</a>
                            </li>
                        </ul>
                    </div>

                    {/* Offcanvas content 
                    <div className={`offcanvas ${showOffcanvas ? 'show' : ''}`}>
                        <ul className="offcanvas-nav">
                            <li className="nav-item">
                                <a className="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link" href="#">Plant Details</a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link" href="#">Data Analytics</a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link" href="#">Login</a>
                            </li>
                        </ul>
                    </div>*/}
                    
                </div>
            </nav>
        </div>
    </>

    );

}

export default UserHome;