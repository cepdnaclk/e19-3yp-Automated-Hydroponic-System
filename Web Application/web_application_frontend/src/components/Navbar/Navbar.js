import React from "react";
import "./Navbar.css";
import { Navbar, Container, Nav } from "react-bootstrap";
import LOGO from "../../Images/Logo.png"
import {Link} from "react-router-dom";



function NavBar() {
    const menuData = [
        {
            path: "/Home_User_New",
            name: "Home"
        },
        {
            path: "/PlantDetails",
            name: "Plant Details"
        },
        {
            path: "/DataAnalytics",
            name: "Data Analytics"
        },
        {
            path: "/Login",
            name: "Login"
        }
    ];

    return (
        <Navbar className="navbar" expand="lg">
            <Container className="navbar-container">
                <Navbar.Brand as={Link} to="/Home_User_New"><img src={LOGO} alt="Logo Not Found" className="responsive-logo"/></Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="ms-auto">
                        {menuData.map((item) => (
                            <Link to={item.path} key={item.name} className="nav-link">
                                <div className="list-item me-3">{item.name}</div>
                            </Link>
                        ))}
                    </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
}

export default NavBar;