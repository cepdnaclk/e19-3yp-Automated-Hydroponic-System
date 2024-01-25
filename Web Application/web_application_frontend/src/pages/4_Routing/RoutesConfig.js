import React from "react";
import { Route, Routes } from "react-router-dom";


import Login from "../LogIn/LogIn";
import RegisterUser from "../LogIn/RegisterUser";
import LandingPage from "../1_Commonpage/LandingPage/HomePage";
import Services from "../1_Commonpage/Services/Services";
import Systems from "../2_AdminPage/systems/systems";
import AdminHome from "../2_AdminPage/AdminHome/AdminHome";
import Home_User_New from "../3_UserPage/Users Home/Home_User_New";
import PlantDetails from "../3_UserPage/Plant Details/Plant_Details";


import ProtectedRoutes from "./protectedRoutes";


function RoutesConfig() {
    return(
        
        <Routes>
            <Route path="/" element={<LandingPage/>}/>
            <Route path="/Services" element={<Services/>}/>
            <Route path="/Login" element={<Login/>}/>

            

            {/* Protected Routes - Admin sec */}
            <Route element={<ProtectedRoutes/>}>
                <Route path="/RegisterUser" element={<RegisterUser/>}/>
                <Route path="/Systems" element={<Systems/>}/>
                <Route path="/AdminHome" element={<AdminHome/>}/>
            </Route>
            {/* Protected Routes - User Section */}
            <Route element={<ProtectedRoutes/>}>
                <Route path="/Home_User_New" element={<Home_User_New/>}/>
                <Route path="/PlantDetails" element={<PlantDetails/>}/>
            </Route>
        </Routes>
        
    )
}

export default RoutesConfig;