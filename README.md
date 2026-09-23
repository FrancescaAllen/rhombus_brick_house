# <h1 align="center"> Rhombus Brick House Challenge - August and September 2026 </h1>

## <ins> Contents </ins>

🖥️ - [Overview](#Overview)

🔬 - [Scope](#Scope)

🧰 - [Tools Used](#Tools-Used)

🚀 - [Deployment Instructions](#Deployment-Instructions)

🕵️ - [Evidence](#Evidence)

📚 - [A Poem](#A-Poem)

---

## Overview
🖥️

The aim of this project was to design, build, deploy and explain a relational database model representing the structure and component parts of a fictional plastic brick house.

The Rhombus Team have developed a PostgreSQL database solution using relational database design principles to demonstrate the planning, construction and management of a brick-built house.

This repository contains the SQL script, deployment instructions and supporting materials required to deploy and demonstrate the solution.

❗*Insert excerpt from Design Rationale here*? ❗

---

## Scope
🔬
- A parts catalogue
- A catalogue of valid colours :tada:
- A way to represent different part-and-colour combinations
- A product breakdown structure for at least one house design
- A quantity-based bill of materials
- Relational Keys, constraints and integrity rules
- A deployed and populated relational database
- Queries demonstrating that the model works
- Documentation explaining your principal design decisions

❗*this section needs ticks or :tada: adding to it when we are happy that it's done* ❗

---

## Tools Used
🧰
- PostgreSQL - Database Management system used to create and manage the database
- pgAdmin 4 - Used to develop, test and administer the database
- Microsoft Excel - Used for creation and review of table designs and documenting draft queries and design rationales
- Microsoft PowerPoint - Used to document deliverables including the data dictionary and presentation materials

---

## Deployment Instructions
🚀

<ins> Prerequisites
- Ensure software detailed above is installed

<ins> Database creation
1. Open pgAdmin and connect

❗ Needs finishing when we know what we're doing - started but not sure how much detail we go into ❗


---
## Evidence
🕵️

<ins> Business Rules

The sample house must contain at least:

- One roof

 <img width="449" height="125" alt="image" src="https://github.com/user-attachments/assets/8bdfa9f4-dd07-4103-9ffa-c3d84f0ec98b" />
 
- Four walls

 <img width="439" height="129" alt="image" src="https://github.com/user-attachments/assets/127f61d2-c979-4071-bde4-feb2b9f3530e" />

- One floor

 <img width="447" height="122" alt="image" src="https://github.com/user-attachments/assets/67ea66a7-dd81-4ae9-98db-11644f7b962b" />

- Two rooms
  
 ❗ Issue here ❗

- One door
 <img width="459" height="129" alt="image" src="https://github.com/user-attachments/assets/ffd00862-e0d3-4707-8bae-a39ce40e55bb" />

- Two windows
 <img width="479" height="118" alt="image" src="https://github.com/user-attachments/assets/3f73fd26-7ab6-4f91-a82f-c20fa107298f" />

<ins> Composition Rules

- Walls must be constructed from brick parts

 <img width="542" height="268" alt="image" src="https://github.com/user-attachments/assets/088aeeff-2cfc-427b-955a-fbf978ed87ac" />

- A roof must contain both tile and rafter parts

<img width="653" height="157" alt="image" src="https://github.com/user-attachments/assets/074e0748-e05e-4ce5-a87a-038ffcd546be" />

- Rooms must be associated with a floor
  
   ❗ Issue here ❗

- Repeated use of the same part should normally be represented using a quantity

 Apparent from table:
 
 <img width="913" height="518" alt="image" src="https://github.com/user-attachments/assets/852eb89c-5cc4-45c4-9623-329a06964a95" />

 - Catalogue definitions must be separated from their physical use in a particular house and *include more than one physical house*

  <img width="239" height="125" alt="image" src="https://github.com/user-attachments/assets/a8ef62cf-c605-473b-8f29-bb47080cfc09" />

  *For example:*

   <img width="574" height="350" alt="image" src="https://github.com/user-attachments/assets/eece1854-d37f-48b0-85e5-21b8f807e294" />

- Quantities must be positive whole numbers

  <img width="924" height="109" alt="image" src="https://github.com/user-attachments/assets/6f134734-3fd4-44b5-bed6-a262e284b53e" />

  *Shows zero rows as all are above zero*

- Employ the use of multiple colours
- 
  <img width="244" height="131" alt="image" src="https://github.com/user-attachments/assets/a97cd46c-1bd0-4c79-a4e1-0527a12c3c06" />

   *For example:*
  
  <img width="568" height="266" alt="image" src="https://github.com/user-attachments/assets/787c6eb0-7f95-4d2a-a3f4-95c2d0fedb12" />

- Required relationships must be protected through appropriate keys and constraints; AND
- Invalid or orphaned references must not be permitted

  <img width="586" height="502" alt="image" src="https://github.com/user-attachments/assets/f629f332-1ff3-442d-a7aa-41e2d9e22e49" />

 A PartColour record cannot exist unless it is linked to a valid Part and a valid Colour due to both fields possessing NOT NULL and being enforced by the relevant Foreign Key.  This prevents the creation of orphaned records.  Using UNIQUE helps ensure that the combination cannot be created more than once.

---

## A Poem
📚
<img width="840" height="545" alt="Cell Brian Bilston" src="https://github.com/user-attachments/assets/9c61a8fb-c28a-459e-85b5-fead909b833f" />

--- 

## Thank you

🦏 Rhombus Team 🦏

⭐ Sept 2026 ⭐
