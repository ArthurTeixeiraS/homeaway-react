import styled from 'styled-components'

export const MyHotelsContainer = styled.div`
  padding: 4% 8%;
  .titleContainer {
    display: flex;
    justify-content: flex-start;
    .arrow {
      margin-right: 1.5rem;
      display: flex;
      a {
        text-decoration: none;
        color: black;
      }
    }
    h1 {
      font-size: 4rem;
      padding: 0 0 2rem 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
      span {
        font-size: 2rem;
        font-weight: normal;
        margin-left: 1rem;
        margin-top: 1rem;
      }
    }
  }
  .hotelsContainer {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    gap: 2rem 0;
    grid-auto-rows: auto;
    h3 {
      font-size: 2rem;
      padding: 1rem 0 0 0.5rem;
    }
    p {
      font-size: 1.3rem;
      padding: 1rem 0 0.5rem 0.5rem;
    }
    .buttons {
      padding-top: 1rem;
      .edit {
        border-radius: 20px;
        background: #ffb60a;
        padding: 1rem 3.5rem;
        font-size: 1.5rem;
        color: white;
        border: 0;
        margin-right: 1.5rem;
        &:hover {
          cursor: pointer;
        }
      }
      .remove {
        border-radius: 20px;
        background: #e8eaec;
        padding: 1rem 3.5rem;
        font-size: 1.5rem;
        color: ${(props) => props.theme.black};
        border: 0;
        &:hover {
          cursor: pointer;
        }
      }
    }
  }
`
