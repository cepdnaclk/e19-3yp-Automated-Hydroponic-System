import React from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const LogoutButton = () => {
  const navigate = useNavigate();

  const handleLogout = async () => {
    const token = localStorage.getItem('token');
    console.log(token);

    if (!token) {
      alert('No token found in local storage. Redirecting to home page.');
      navigate('/');
      return;
    }

    try {
      const response = await axios.post('http://localhost:8080/api/v1/auth/logout', null, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.status === 200) {
        // Logout successful, clear the token and redirect
        //localStorage.removeItem('token');
        // Remove all tokens from local storage
        localStorage.clear();
        alert('Logout successful');
        navigate('/');
      } else {
        // Handle other status codes, if needed
        alert('Logout failed. Please try again.');
      }

    } catch (error) {
      if (error.response) {
        // Server responded with an error (4xx or 5xx)
        alert('Logout failed. Server responded with an error.');
      } else if (error.request) {
        // No response received from the server
        alert('Logout failed. No response received from the server.');
        console.log(error.request);
      } else {
        // Unexpected error
        alert('Logout failed due to an unexpected error.');
      }
    }
  };
  const linkStyle = {
    color: 'white', // Set the text color to blue
    /*border: '1px solid blue', // Add a 1px solid blue border*/
    padding: '5px 10px', // Add padding to make it visually appealing
    textDecoration: 'none', // Remove the default underline for links
    display: 'inline-block', // Set it to inline-block to apply the styles
    borderRadius: '5px',
    backgroundColor: '#af0505', // Set the background color to red
  };

  return (
    <button style={linkStyle} onClick={handleLogout} > Log Out </button>
  );
};

export default LogoutButton;
