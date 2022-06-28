import * as React from "react";
import { Card, CardContent, CardHeader, Container } from "@mui/material";
// import { Masonry } from "@mui/lab";
import Masonry from "react-masonry-css";
import { styled } from "@mui/material/styles";
import Paper from "@mui/material/Paper";
import * as fcl from "@onflow/fcl";
import "../flow/config"

const heights = [150, 500];

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
  ...theme.typography.body2,
  padding: theme.spacing(0.5),
  textAlign: "center",
  color: theme.palette.text.secondary,
}));

export default function Dashboard() {
  {console.log(fcl)}
  return (
    <>
      <Container>
        {/* Wallet */}
        <div>
          <button
            className="bg-gray-100 hover:bg-gray-200 focus:bg-gray-200 border hover:border-gray-300 focus:border-gray-300 rounded shadow-lg absolute top-4 right-4 lg:top-8 lg:right-8 p-4 flex items-center text-xs disabled:cursor-not-allowed"
            onClick={() => fcl.authenticate()}
            // disabled={user.loggedIn}
          >
            {
              <>
                <span className="rounded-full h-2 w-2 block mr-2 bg-green-500" />
              </>
            }
            {"user.addr"}
          </button>
          <button className="" onClick={fcl.unauthenticate}>
            Disconnect
          </button>
        </div>
      </Container>
    </>
  )
}


// export default ({ fcl, flowUser }) => (
//   <React.Fragment>
//     <Container maxWidth="lg">

//     {/* Wallet */}
//     <div>
//     {console.log(fcl)}
//           <button
//             className="bg-gray-100 hover:bg-gray-200 focus:bg-gray-200 border hover:border-gray-300 focus:border-gray-300 rounded shadow-lg absolute top-4 right-4 lg:top-8 lg:right-8 p-4 flex items-center text-xs disabled:cursor-not-allowed"
//             onClick={() => fcl.authenticate()}
//             disabled={flowUser.loggedIn}
//           >
//             {
//               <>
//                 <span className="rounded-full h-2 w-2 block mr-2 bg-green-500" />
//               </>
//             }
//             {flowUser.addr}
//           </button>
//           <button className="" onClick={fcl.unauthenticate}>
//             Disconnect
//           </button>
//         </div>

//       <Card>
//           <CardHeader title="LJL Admin" />
//           <CardContent>Lorem ipsum sic dolor amet sic...</CardContent>
//       </Card>
//     </Container>
//     {/* <Container>
//       <Masonry
//         breakpointCols={3}
//         className="my-masonry-grid"
//         columnClassName="my-masonry-grid_column"
//       >
//         {heights.map((height, index) => (
//           <div>
//           <Item key={index} sx={{ height }}>
//             {index + 1}
//           </Item>
//           </div>
//         ))}
//       </Masonry>
//     </Container> */}
//   </React.Fragment>
// );
