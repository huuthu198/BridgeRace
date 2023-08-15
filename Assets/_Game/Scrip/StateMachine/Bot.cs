using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Bot : CharacterController
{
   public NavMeshAgent agent;
    private Vector3 destination;
    public bool isDestination => Vector3.Distance(destination, transform.position) < 0.1f;
    public void SetDestionation(Vector3 position)
    {
        destination = position;
        agent.SetDestination(position);
    }
    IState<Bot> currentState;
    private void Update()
    {
        if (currentState != null)
        {
            currentState.OnExecute(this);
        }
    }
    public void ChangeState(IState<Bot> state)
    {
        if( currentState != null)
        {
            currentState.OnExit(this);
        }
        currentState = state;
        if( currentState != null )
        {
            currentState.OnEnter(this);
        }
    }
}
