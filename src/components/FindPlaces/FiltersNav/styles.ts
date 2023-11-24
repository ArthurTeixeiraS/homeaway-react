import styled from 'styled-components'

export const FilterNav = styled.div`
  display: flex;
  justify-content: center;
  list-style: disc;
  padding: 5rem 3rem 1rem 3rem;

  .filterButton {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 5rem;
    button {
      background-color: transparent;
      border: 1px solid ${(props) => props.theme.black};
      font-size: 1.8rem;
      padding: 0.5rem 1rem;
      border-radius: 2rem;
      img {
        margin-right: 0.8rem;
        margin-bottom: -0.1rem;
      }
    }
  }
  .inputContainer {
    width: 45%;
    height: 2.5rem;
    border: none;
    border-radius: 10px;
    padding: 1rem;
    border: 1px solid #2e2e2e;
    background-color: white;
    display: flex;
    align-items: center;
    height: 5rem;
    button {
      background-color: transparent;
      border: 0;
      margin-right: 0.5rem;
      &:hover {
        cursor: pointer;
      }
    }
  }
  .inpt-search {
    background-color: transparent;
    border: none;
    font-size: 1.8rem;
    width: 100%;
    margin-left: 5px;
    height: 5rem;
  }

  .inpt-search:focus {
    outline: none;
    border: 0;
  }
  #search-icon {
    color: #4086f4;
    width: 1.5rem;
    height: 1.5rem;
  }
`
