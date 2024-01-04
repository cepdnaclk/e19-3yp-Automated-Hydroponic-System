import React, { useState } from 'react';
import axios from 'axios';
import "./LogIn.css";
import Navbar from "../../components/Navbar/Navbar";
import { useNavigate } from 'react-router-dom';
import AUTHIMAGE from "../../Images/auth-img.png";
import { FaEye, FaEyeSlash } from 'react-icons/fa';

function Login() {
  const [credentials, setCredentials] = useState({
    username: '',
    password: '',
  });
  const [error, setError] = useState(null);
  const [passwordVisible, setPasswordVisible] = useState(false);

  //const navigate = useNavigate();

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
    const expirationTime = 24 * 60 * 60 * 1000; // 1 day in milliseconds
    setTimeout(() => {
      // Clear the token from local storage when the timer expires
      localStorage.removeItem('token');
    }, expirationTime);
  };
  

  const handleSubmit = async (e) => {
    e.preventDefault();
  
    try {
      const response = await axios.post('http://localhost:8080/api/v1/auth/authenticate', credentials);
  
      if (response.status === 200) {
        const token = response.data.token;
        setTokenInLocalStorage(token); // Set the token and start the timer
        // Set the email in state and navigate to the LandingPage
        setEmail(credentials.email);
        alert("Authentication successfull")
        //navigate('/LandingPage', { state: { email: credentials.email } });
      }
    } catch (error) {
      console.error('Login failed', error);
      setError('Login failed. Please check your credentials.');
    }
  };
  

  return (
    <>
    <Navbar/>
    <div className='login-container row'>
      <div className='login-inner-container'>

          <div className='auth-image row'>
            <img id="auth-image"src={AUTHIMAGE} alt='Authentication Image is missing'/>
          </div>

          <div className='auth-form'>
            <form onSubmit={{handleSubmit}}>

              <div className='user-name row'>
                <label className='login-form-label row' htmlFor="email">Enter Email Address:</label>
                <input
                  type="text"
                  name="email"
                  className='login-form-control row'
                  value={credentials.email}
                  onChange={handleChange}
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
                  required
                />
                <span onClick={togglePasswordVisibility} className='eye-icon'>
                  {passwordVisible ? <FaEyeSlash /> : <FaEye />}
                </span>
              </div>

              <div className='login-button-container row'>
                <button id='login-button' type='submit' className='btn btn-success'>LogIn</button>
              </div>

            </form> 
          </div>
      </div>
    </div>
    </>
  );
}

export default Login;

