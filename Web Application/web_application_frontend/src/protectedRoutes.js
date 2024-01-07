import { Navigate, Outlet } from "react-router-dom";

const useAuth = () => {
  // Check if the token exists in local storage
  const token = localStorage.getItem("token");

  return token !== null;
};

const ProtectedRoutes = () => {
  const isAuth = useAuth();

  return isAuth ? <Outlet /> : <Navigate to="/" />;
};

export default ProtectedRoutes;
