import React from "react";
import "./Admin_Navbar.css";
import { Link } from "react-router-dom";
import { Navbar, Container, Nav } from "react-bootstrap";
import LOGO from "../../Images/Logo.png";

function AdminNavBar() {
    const menuData = [
        {
            path: "/AdminHome",
            name: "Home"
        },
        {
            path: "/Systems",
            name: "Systems"
        },
        {
            path: "/RegisterUser",
            name: "User Management"
        },
        {
            path: "/",
            name: "Log Out"
        }
    ];

    return (
        <Navbar className="navbar" expand="lg">
            <Container className="navbar-container">
                <Link to="/AdminHome" className="navbar-brand">
                    <img src={LOGO} alt="Logo Not Found" className="responsive-logo"/>
                </Link>
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

export default AdminNavBar;
