import * as React from "react";
import { Admin, Resource } from 'react-admin';
import jsonServerProvider from 'ra-data-json-server';
import UserIcon from '@mui/icons-material/Group';
import ApprovalIcon from '@mui/icons-material/Approval';
import Dashboard from './components/Dashboard';
import { UserList } from './users';
import authProvider from "./authProvider";



const dataProvider = jsonServerProvider('http://jsonplaceholder.typicode.com')

function App() {
  return (
    <Admin dashboard={Dashboard} authProvider={authProvider} dataProvider={dataProvider}>
      <Resource name="users" options={{ label: "Mint"}} list={UserList} icon={ApprovalIcon} />
    </Admin>
  );
}

export default App;
