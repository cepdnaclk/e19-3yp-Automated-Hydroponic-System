import React from "react";
import { Route, Routes } from "react-router-dom";

import PlantDetails from "./pages/Plant Details/Plant_Details";
import LandingPage from "./pages/LandingPage/LandingPage";
import Services from "./pages/Services/Services";
import Login from "./pages/LogIn/LogIn";
import RegisterUser from "./pages/LogIn/RegisterUser";
import Systems from "./pages/systems/systems";
import AdminHome from "./pages/AdminHome/AdminHome";

import ProtectedRoutes from "./protectedRoutes";

function RoutesConfig() {
    return(
        <>
        <Routes>
            <Route path="/" element={<LandingPage/>}/>
            <Route path="/Services" element={<Services/>}/>
            <Route path="/Login" element={<Login/>}/>
            

            /* Protected Routes - Admin sec */
            <Route element={<ProtectedRoutes/>}>
                <Route path="/RegisterUser" element={<RegisterUser/>}/>
                <Route path="/Systems" element={<Systems/>}/>
                <Route path="/AdminHome" element={<AdminHome/>}/>
            </Route>
        </Routes>
        </>
    )
}

export default RoutesConfig;