import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';


function Login() {
  const [credentials, setCredentials] = useState({
    username: '',
    password: '',
  });
  const [error, setError] = useState(null);
  const [showPassword, setShowPassword] = useState(false);

  const navigate = useNavigate();

  // Store the email in a state variable
  const [email, setEmail] = useState('');

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
      const response = await axios.post('http://localhost:8080/authenticate', credentials);
  
      if (response.status === 200) {
        const token = response.data.token;
        setTokenInLocalStorage(token); // Set the token and start the timer
        // Set the email in state and navigate to the LandingPage
        setEmail(credentials.email);
        navigate('/LandingPage', { state: { email: credentials.email } });
      }
    } catch (error) {
      console.error('Login failed', error);
      setError('Login failed. Please check your credentials.');
    }
  };
  

  const containerStyle = {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    height: '400px', // Changed to pixels
  };

  const cardStyle = {
    width: '352px', // Approximately 22rem
    padding: '16px', // Equivalent to 1rem
    backgroundColor: '#f8f8f8',
    border: '1px solid #ccc',
    borderRadius: '5px',
    boxShadow: '0 2px 4px rgba(0, 0, 0, 0.1)',
  };

  const titleStyle = {
    textAlign: 'center',
    fontSize: '24px', // Approximately 1.5rem
  };

  const formStyle = {
    marginTop: '16px', // Equivalent to 1rem
  };

  const inputStyle = {
    marginBottom: '16px', // Equivalent to 1rem
    width: '340px', // Approximately 22rem
    padding: '8px', // Equivalent to 0.5rem
    fontSize: '16px', // Approximately 1rem
    border: '1px solid #ccc',
    borderRadius: '3px',
  };

  const buttonStyle = {
    width: '360px', // Approximately 22rem
    padding: '8px', // Equivalent to 0.5rem
    fontSize: '16px', // Approximately 1rem
    border: '1px solid #ccc',
    borderRadius: '3px',
    backgroundColor: '#007bff',
    color: '#fff',
    cursor: 'pointer',
    borderRadius: '3px',
  };

  const togglePasswordStyle = {
    position: 'relative',
  };

  const eyeIconStyle = {
    position: 'absolute',
    right: '10px',
    top: '65%',
    transform: 'translateY(-50%)',
    cursor: 'pointer',
  };

  const passwordInputStyle = {
    width: '340px', // Approximately 22rem
    padding: '8px', // Equivalent to 0.5rem
    fontSize: '16px', // Approximately 1rem
    border: '1px solid #ccc',
    borderRadius: '3px',
  };

  return (
    <div style={containerStyle}>
      <div style={cardStyle}>
        <h3 style={titleStyle}>Login</h3>
        {error && <div style={{ color: 'red' }}>{error}</div>}
        <form style={formStyle} onSubmit={handleSubmit}>
          <div>
            <label htmlFor="email">Email :</label>
            <input
              type="text"
              name="email"
              style={inputStyle}
              value={credentials.email}
              onChange={handleChange}
              required
            />
          </div>
          <div style={togglePasswordStyle}>
            <label htmlFor="password">Password :</label>
            <input
              type={showPassword ? 'text' : 'password'}
              name="password"
              style={passwordInputStyle}
              value={credentials.password}
              onChange={handleChange}
              required
            />
            <span style={eyeIconStyle} onClick={() => setShowPassword(!showPassword)}>
              {showPassword ? '👁️' : '👁️'}
            </span>
          </div>
          <br></br>
          <button type="submit" style={buttonStyle}>
            Log In
          </button>
        </form>
      </div>
    </div>
  );
}

export default Login;

