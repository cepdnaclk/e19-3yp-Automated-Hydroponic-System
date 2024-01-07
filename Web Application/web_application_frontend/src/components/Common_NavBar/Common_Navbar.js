import React from "react";
import { Link } from "react-router-dom"; // Import Link from react-router-dom
import { Navbar, Container, Nav } from "react-bootstrap";
import LOGO from "../../Images/Logo.png";
import "./Common_Navbar.css";

function CommonNavBar() {
    const menuData = [
        {
            path: "/",
            name: "Home"
        },
        {
            path: "/Services",
            name: "Service"
        },
        {
            path: "/Login",
            name: "Login"
        }
    ];

    return (
        <Navbar className="navbar" expand="lg">
            <Container className="navbar-container">
                <Link to="/"><Navbar.Brand><img src={LOGO} alt="Logo Not Found" className="responsive-logo"/></Navbar.Brand></Link>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="ms-auto">
                        {menuData.map((item) => (
                            <Link to={item.path} key={item.name}><Nav.Link as="div"><div className="list-item me-3">{item.name}</div></Nav.Link></Link>
                        ))}
                    </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
}

export default CommonNavBar;
