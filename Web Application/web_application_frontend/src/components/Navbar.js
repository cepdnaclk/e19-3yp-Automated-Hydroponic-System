import React from "react";
import "../components/Navbar.css";
import { Navbar, Container, Nav } from "react-bootstrap";
import LOGO from "../Images/Logo.png"


function NavBar() {
    const menuData = [
        {
            path: "/",
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
                <Navbar.Brand href="#Home"><img src={LOGO} alt="Logo Not Found" className="responsive-logo"/></Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="ms-auto">
                        {menuData.map((item) => (
                            <Nav.Link to={item.path} key={item.name}>
                                <div className="list-item me-3">{item.name}</div>
                            </Nav.Link>
                        ))}
                    </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
}

export default NavBar;
