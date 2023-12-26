import React, { useState } from 'react';
import { Link } from 'react-router-dom'; // Import Link for internal links
import './Searchbar.css';
import {FaSearch,FaTimes} from 'react-icons/fa';

function SearchBar({ placeholder, data }) {
  const [filteredData, setFilteredData] = useState([]);
  const [wordEntered, setWordEntered] = useState('');

  const handleFilter = (event) => {
    const searchWord = event.target.value;
    setWordEntered(searchWord);
    const newFilter = data.filter((value) => {
      return (
        value?.title?.toLowerCase?.().includes(searchWord.toLowerCase()) || false
      );
    });
    if (searchWord === '') {
      setFilteredData([]);
    } else {
      setFilteredData(newFilter);
    }
  };
  

  const clearInput = () => {
    setFilteredData([]);
    setWordEntered('');
  };

  const handleLinkClick = () => {
    setFilteredData([]);
    clearInput();
  };

  return (
    <div className="search row">
      <div className='searchBar row'>
        <div className="searchInputs">
          <input id='inputField' type="text" placeholder="Search..." value={wordEntered} onChange={handleFilter} />
        </div>

        <div className="searchIcon">
          {filteredData.length === 0 ? (
            <FaSearch style={{width: "20px",height: "20px"}}/>
          ) : (
            <div id="clearButton" onClick={clearInput}>
              <FaTimes style={{width: "20px",height: "20px"}}/>
            </div>
          )}
        </div>
      </div>
      
      {filteredData.length !== 0 && (
        <div className="dataResult">
          {filteredData.slice(0, 5).map((value, key) => {
            return (
              value.path.startsWith('http') ? ( // Check if it's an external link
                <a href={value.path} target="_blank" rel="noopener noreferrer" key={key}>
                  <p>{value.title}</p>
                </a>
              ) : (
                <Link to={value.path} key={key} onClick={handleLinkClick}>
                  <p>{value.title}</p>
                </Link>
              )
            );
          })}
        </div>
      )}
    </div>
  );
}

export default SearchBar;
