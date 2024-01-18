import React, { useState } from 'react';
import axios from 'axios';
import "./LogIn.css";
import CommonNavBar from '../../components/Common_NavBar/Common_Navbar';
import { useNavigate } from 'react-router-dom';
import AUTHIMAGE from "../../Images/auth-img.png";
import { FaEye, FaEyeSlash } from 'react-icons/fa';
import {jwtDecode}   from "jwt-decode";



function Login() {
  const [credentials, setCredentials] = useState({
    username: '',
    password: '',
  });
  const [error, setError] = useState(null);
  const [passwordVisible, setPasswordVisible] = useState(false);

  const navigate = useNavigate();

  // Store the email in a state variable
  const [email, setEmail] = useState('');

  const togglePasswordVisibility = () => {
    setPasswordVisible(prevState => !prevState)
  }

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCredentials({ ...credentials, [name]: value });
  };

  const setTokenInLocalStorage = (token) => {
    localStorage.setItem('token', token);
  
    // Set a timer to remove the token after a certain time (e.g., 30 minutes)
    const expirationTime = 60 * 60 * 1000; // 1 hr in milliseconds
    setTimeout(() => {
      // Clear the token from local storage when the timer expires
      localStorage.removeItem('token');
    }, expirationTime);
  };
  

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    try {
      const response = await axios.post('http://localhost:8080/api/v1/auth/authenticate', credentials);
      console.log(response);
      if (response.status === 200) {
        const token = response.data.access_token;
        setTokenInLocalStorage(token); // Set the token and start the timer
        // Set the email in state and navigate to the LandingPage
        setEmail(credentials.email);
        
        
        const decodedToken = jwtDecode(token);
        const authorities = decodedToken.authorities;
        console.log('authorities', authorities);

        
        if(authorities.includes("ROLE_ADMIN")){
          alert("Authentication successfull");
          navigate('/AdminHome');
        }else if(authorities.includes("ROLE_USER")){
          alert("Authentication successfull");
          navigate('/Home_User_New');
        }else{
          alert("You are not authorized to access the data");
          navigate('/')
        }
      }
    } catch (error) {
      console.error('Login failed', error);
      setError('Login failed. Please check your credentials.');
    }
  };
  

  return (
    <>
    <CommonNavBar/>
    <div className='login-container row'>
      <div className='login-inner-container'>

          <div className='auth-image row'>
            <img id="auth-image"src={AUTHIMAGE} alt='Authentication Image is missing'/>
          </div>

          <div className='auth-form'>
            <form onSubmit={handleSubmit}>

              <div className='user-name row'>
                <label className='login-form-label row' htmlFor="email">Enter Email Address:</label>
                <input
                  type="text"
                  name="email"
                  className='login-form-control row'
                  value={credentials.email}
                  onChange={handleChange}
                  placeholder='example123@gmail.com'
                  required
                />
              </div>

              <div className='pass-word row'>
                <label htmlFor="password" className='login-form-label row'>Enter Password :</label>
                <input
                  type={passwordVisible ? 'text' : 'password'}
                  name="password"
                  className='login-form-control row'
                  value={credentials.password}
                  onChange={handleChange}
                  placeholder='password'
                  required
                />
                <span onClick={togglePasswordVisibility} className='eye-icon'>
                  {passwordVisible ? <FaEyeSlash /> : <FaEye />}
                </span>
              </div>

              <div className='login-button-container row'>
                <button id='login-button' type='submit' className='btn btn-success'>LogIn</button>
                <p style={{padding: "5px"}}> Check Pages? | <a href='/Systems'>Check</a></p>
              </div>

            </form> 
          </div>
      </div>
    </div>
    </>
  );
}

export default Login;

