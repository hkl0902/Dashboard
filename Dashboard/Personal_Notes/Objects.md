# Objects

## TrackingItem

- Represent any item being tracked/was tracked
- Both User/Autonomous items

- **Types**
    - HasGoal (i.e. 10,000 steps per day)
    - Simple Numeric Value
    - Range Value
    - MC (Yes/No)

- **Attributes**
    - name
    - hasGoal
    - isActive (currently tracking or is archived)
    -

- Has a `toOne` relationship with Options

## Options

- Represents the MC options/Ranges that a user could pick as an answer

- **Attributes**
    - Option_1 - Option_05  (String)
    - Count_1 - Count_05    (Numeric)
