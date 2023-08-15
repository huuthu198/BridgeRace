using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PatrolState : IState<Bot>
{
    int target;
    public void OnEnter(Bot t)
    {
        target = Random.Range(2, 6);
        Vector3 brickPoint = t.transform.position;
    }

    public void OnExecute(Bot t)
    {

    }

    public void OnExit(Bot t)
    {

    }

}
